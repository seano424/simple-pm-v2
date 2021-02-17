class Task < ApplicationRecord
  belongs_to :project

  validates :status, inclusion: { in: %w(not-started in-progress completed) }

  STATUS_OPTIONS = [
    ['Not Started', 'not-started'],
    ['In Progress', 'in-progress'],
    ['Completed', 'completed'],
  ]

  def badge_color 
    case status
    when 'not-started'
      'secondary'
    when 'in-progress'
      'info'
    when 'completed'
      'success'
    end
  end

  def completed?
    status == 'completed'
  end

  def in_progress?
    status == 'in-progress'
  end

  def not_started?
    status == 'not started'
  end
end
