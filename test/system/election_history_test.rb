require 'application_system_test_case'

class ElectionHistoryTest < ApplicationSystemTestCase
  setup do
    @voter_one = voters(:one)
    @voter_two = voters(:two)
    @question = questions(:one)
    @answer = answers(:one)
    @election = elections(:one)
  end

  test 'history lists the creation of a voter' do
    Voter.create election: @election

    visit election_history_voter_url(@voter_two)

    assert_text @election.name
    assert_text @election.user.email
    assert_text 'Voter'
    assert_text 'Create'
    assert_text "Election Id was changed from EMPTY to #{@election.id}"
  end

  test 'history lists the update of a voter' do
    @voter_one.update name: 'Updated Name'

    visit election_history_voter_url(@voter_two)

    assert_text @voter_one.election.name
    assert_text @voter_one.election.user.email
    assert_text 'Voter'
    assert_text 'Update'
    assert_text 'Name was changed from MyString to Updated Name'
  end

  test 'history lists a destroyed voter' do
    @voter_one.destroy

    visit election_history_voter_url(@voter_two)

    assert_text @voter_one.election.name
    assert_text @voter_one.election.user.email
    assert_text 'Voter'
    assert_text 'Destroy'
  end

  test 'history lists the creation of a question' do
    Question.create election: @election

    visit election_history_voter_url(@voter_one)

    assert_text @election.name
    assert_text @election.user.email
    assert_text 'Question'
    assert_text 'Create'
    assert_text "Election Id was changed from EMPTY to #{@election.id}"
  end

  test 'history lists an update of a question' do
    @question.update name: 'Updated Name'

    visit election_history_voter_url(@voter_one)

    assert_text @question.election.name
    assert_text @question.election.user.email
    assert_text 'Question'
    assert_text 'Update'
    assert_text 'Name was changed from MyString to Updated Name'
  end

  test 'history lists a destroyed question' do
    @question.destroy

    visit election_history_voter_url(@voter_one)

    assert_text @question.election.name
    assert_text @question.election.user.email
    assert_text 'Question'
    assert_text 'Destroy'
  end

  test 'history lists the creation of an answer' do
    Answer.create question: @question

    visit election_history_voter_url(@voter_one)

    assert_text @question.election.name
    assert_text @question.election.user.email
    assert_text 'Question'
    assert_text 'Create'
    assert_text "Question Id was changed from EMPTY to #{@question.id}"
  end

  test 'history lists an update of an answer' do
    @answer.update name: 'Updated Name'

    visit election_history_voter_url(@voter_one)

    assert_text @answer.question.election.name
    assert_text @answer.question.election.user.email
    assert_text 'Answer'
    assert_text 'Update'
    assert_text 'Name was changed from MyString to Updated Name'
  end

  test 'history lists a destroyed answer' do
    @answer.destroy

    visit election_history_voter_url(@voter_one)

    assert_text @answer.question.election.name
    assert_text @answer.question.election.user.email
    assert_text 'Answer'
    assert_text 'Destroy'
  end

  test 'history lists an update of an election' do
    @election.update name: 'Updated Name'

    visit election_history_voter_url(@voter_one)

    assert_text @election.name
    assert_text @election.user.email
    assert_text 'Election'
    assert_text 'Update'
    assert_text 'Name was changed from MyString to Updated Name'
  end
end
