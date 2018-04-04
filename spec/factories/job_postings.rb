FactoryBot.define do
  factory :job_posting do
    title "Software Developer"
    job_poster
    category
    location

    trait :new_post do
      status "new_post"
    end

    trait :pending do
      status "pending"
    end

    trait :complete do
      status "complete"
    end
  end
end
