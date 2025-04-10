module ErrorHandling
  extend ActiveSupport::Concern

  included do
    # before_action :set_sentry_context
    rescue_from StandardError, with: :standard_exception
    rescue_from LpTokenAuth::Error, with: :unauthorized
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActionController::RoutingError, with: :not_found
    rescue_from UnprocessableEntity, with: :unprocessable_entity
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
    rescue_from Decanter::UnhandledKeysError, with: :unprocessable_entity
    rescue_from ActiveRecord::AssociationNotFoundError, with: :bad_request
    rescue_from ActionController::BadRequest, with: :bad_request
    rescue_from ActionController::ParameterMissing, with: :bad_request
    rescue_from NotAuthorized, with: :unauthorized
    rescue_from ActiveRecord::RecordNotDestroyed, with: :conflict
  end

  # def set_sentry_context
  #   Sentry.set_user(id: @current_user.try(&:id)) if @current_user
  #   Sentry.set_extras(params: params.to_unsafe_h, url: request.url)
  # end

  def standard_exception(error)
    handle_error(error, default_message: 'internal server error')
  end

  def not_found(error)
    handle_error(error, default_message: 'not found', status: :not_found)
  end

  def unprocessable_entity(error)
    handle_error(error, default_message: 'unprocessable entity', status: :unprocessable_entity)
  end

  def bad_request(error)
    handle_error(error, default_message: 'bad request', status: :bad_request)
  end

  def unauthorized(error)
    handle_error(error, default_message: 'not authorized', status: :unauthorized)
  end

  def conflict(error)
    handle_error(error, default_message: 'conflict', status: :conflict)
  end

  def handle_error(error, default_message: nil, status: :internal_server_error)
    log_stack_trace(error)
    message = get_error_message(error, default_message)
    send_error_message(message, status: status)
  end

  def send_error_message(message, **)
    # https://jsonapi.org/format/#error-objects
    render(json: { errors: [{ title: message }] }, **)
  end

  private

  # Helpers

  def message?(error)
    error.message != error.class.name
  end

  def get_error_message(error, default_message = '')
    message?(error) ? error.message : default_message
  end

  def log_stack_trace(error)
    logger.error "#{error.class} - #{error.message}"
    stacktrace = get_pretty_stack_trace(error)
    stacktrace.each { |line| logger.error line }
  end

  def get_pretty_stack_trace(error)
    current_dir = File.join(Dir.getwd, '')
    current_dir_regex = /^#{Regexp.escape(current_dir)}/
    error.backtrace
         .map { |line| line.sub current_dir_regex, '' } # remove absolute path from filenames
         .select { |line| line.starts_with? 'app' } # only show files from current app
  end
end
