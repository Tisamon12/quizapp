FactoryBot.define do
	factory :user do
		sequence :name do |n|
			"ExampleName#{n}"
		end
		password {SecureRandom.hex(8)}
		password_confirmation {password}
	end
end