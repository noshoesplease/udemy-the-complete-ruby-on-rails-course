class Project < ApplicationRecord
  belongs_to :team
  has_many :artifacts, dependent: :destroy

  # validates_uniqueness_of :title
  # validate :free_plan_can_only_have_one_project

  # def free_plan_can_only_have_one_project
  #   if self.new_record? && (team.projects.count > 0) && (team.plan == "free")
  #     errors.add(:base, "Free plans cannot have more than one project")
  #   end
  # end

  # def self.by_plan_and_team(team_id)
  #   team = Team.find(team_id)
  #   if team.plan == "premium"
  #     team.projects
  #   else
  #     team.projects.order(:id).limit(1)
  #   end
  # end
end
