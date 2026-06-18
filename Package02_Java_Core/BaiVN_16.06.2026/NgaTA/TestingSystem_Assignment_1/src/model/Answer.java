package model;

public class Answer {
    int answerID;
    String content;
    Question question;
    boolean isCorrect;

    public Answer() {
    }

    public Answer(int answerID, String content, Question question, boolean isCorrect) {
        this.answerID = answerID;
        this.content = content;
        this.question = question;
        this.isCorrect = isCorrect;
    }

    public int getAnswerID() {
        return answerID;
    }

    public void setAnswerID(int answerID) {
        this.answerID = answerID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public boolean isCorrect() {
        return isCorrect;
    }

    public void setCorrect(boolean correct) {
        isCorrect = correct;
    }
}
