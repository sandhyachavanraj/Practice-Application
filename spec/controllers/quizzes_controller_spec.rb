require "spec_helper"

describe QuizzesController do
	login_user

	before do
		@quiz_user = []
		@quiz_answered = []
		@user = FactoryGirl.create(:user)
		controller.stub(:current_user).and_return(@user)
		@question = FactoryGirl.create(:question)
		@quizzes = FactoryGirl.create_list(:quiz, 3)
		@quizzes.each do |quiz|
				@quiz_user << FactoryGirl.create(:quiz_user, :quiz_id => quiz.id, :user_id => @user.id)
		end
		@quiz_answered << FactoryGirl.create_list(:answer, 3, :quiz_user_id => @quiz_user.first.id, :question_id => @question.id)
	end
	describe "Get index" do
		it "should return all quizzes" do
			get "index"
			assigns[:quizzes].first.should eql(@quizzes.first)
		end

		it "should return answered quizzes" do
			get "index"
			assigns[:quiz_answered].first.should eql(@quiz_user.first.quiz_id)
		end

		it "render the index template" do
			get "index"
			response.should render_template("index")
		end
	end
end