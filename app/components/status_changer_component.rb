# frozen_string_literal: true

class StatusChangerComponent < ViewComponent::Base
  attr_reader :task_id, :status

  def initialize(task_id:, status:)
    @task_id = task_id
    @status = status
  end

  def color_class
    case status
    when 'not-started'
      'secondary'
    when 'in-progress'
      'info'
    when 'completed'
      'success'
    end
  end

  def readable_status
    case status
    when 'not-started'
      'Not started'
    when 'in-progress'
      'In progress'
    when 'completed'
      'Completed'
    end
  end

  def options
    Task::STATUS_OPTIONS.map do |option|
      Struct.new(:readable, :slugged).new(*option)
    end
  end

end
