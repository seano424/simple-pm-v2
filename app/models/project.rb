class Project < ApplicationRecord
  has_many :tasks, :dependent => :destroy
  belongs_to :user

  def status
    return 'not-started' if tasks.none?

    if tasks.all? { |task| task.completed? }
      'completed'
    elsif tasks.any? { |task| task.in_progress? }
      'in-progress'
    else
      'not-started'
    end
  end

  def percent_completed
    return 0 if tasks.none?

    ((total_complete.to_f / total_tasks) * 100).round
  end

  def total_complete
    tasks.select { |task| task.completed? }.count
  end

  def total_tasks
    tasks.count
  end

end
