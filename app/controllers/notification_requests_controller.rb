# frozen_string_literal: true

require_relative '../models/notification_request.rb'
require_relative '../decorators/notification_request_decorator.rb'
require_relative '../exceptions/unprocessable_entity_error.rb'
require_relative '../exceptions/resource_not_found_error.rb'
require_relative '../helpers/notification_request_status_creator.rb'
require_relative '../../infra/email/new_notification_request_email_sender.rb'

class NotificationRequestController
  def initialize(
    params:,
    notification_request_email_sender_class: NewNotificationRequestEmailSender,
    notification_request_status_creator_class: NotificationRequestStatusCreator
  )
    @params = params
    @notification_request_email_sender_class = notification_request_email_sender_class
    @notification_request_status_creator_class = notification_request_status_creator_class
  end

  def create # rubocop:todo Metrics/MethodLength
    notification_request = NotificationRequest.new(creation_params)
    unless notification_request.valid?
      raise UnprocessableEntityError, notification_request.errors.to_json
    end

    ActiveRecord::Base.transaction do
      notification_request.save
      @notification_request_email_sender_class.new(
        to: notification_request.email_for_contact,
        tracking_code: notification_request.tracking_code
      ).send
    end

    NotificationRequestDecorator.call(notification_request)
  end

  def update_status
    notification_request_status = NotificationRequestStatus.new(update_status_params)
    unless notification_request_status.valid?
      raise UnprocessableEntityError, notification_request_status.errors.to_json
    end

    @notification_request_status_creator_class
      .new(notification_request_status)
      .create!
  end

  private

  def creation_params
    {
      tracking_code: @params['tracking_code'],
      email_for_contact: @params['email_for_contact'],
      delivery_company_id: @params['delivery_company_id']
    }
  end

  def update_status_params
    @update_status_params ||= {
      notification_request_id: @params['notification_request_id'],
      content: @params['content']
    }
  end
end
