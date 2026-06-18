import common.enums.PositionName;
import common.enums.TypeName;
import model.*;

import java.util.Date;

public class Program {

    public static void main(String[] args) {

        // Department
        Department dep1 = new Department(1, "Sales");
        Department dep2 = new Department(2, "Marketing");
        Department dep3 = new Department(3, "Information Technology");

        // Position
        Position pos1 = new Position(1, PositionName.DEV);
        Position pos2 = new Position(2, PositionName.TEST);
        Position pos3 = new Position(3, PositionName.SCRUM_MASTER);
        Position pos4 = new Position(4, PositionName.PM);

        // Account
        Account acc1 = new Account(1, "ngatruong@gmail.com", "Truong Ai Nga", "ngatruong", dep3, pos1, new Date());

        Account acc2 = new Account(2, "minhnguyen@gmail.com", "Nguyen Van Minh", "minhnguyen", dep1, pos2, new Date());

        Account acc3 = new Account(3, "linhpham@gmail.com", "Pham Thuy Linh", "linhpham", dep2, pos4, new Date());

        // Group
        Group group1 = new Group(1, "Java Core Team", acc1, new Date());
        Group group2 = new Group(2, "SQL Practice Group", acc2, new Date());
        Group group3 = new Group(3, "Testing System Project", acc3, new Date());

        // GroupAccount
        GroupAccount groupAccount1 = new GroupAccount(group1, acc1, new Date());
        GroupAccount groupAccount2 = new GroupAccount(group1, acc2, new Date());
        GroupAccount groupAccount3 = new GroupAccount(group2, acc3, new Date());

        // TypeQuestion
        TypeQuestion type1 = new TypeQuestion(1, TypeName.ESSAY);
        TypeQuestion type2 = new TypeQuestion(2, TypeName.MULTIPLE_CHOICE);
        TypeQuestion type3 = new TypeQuestion(3, TypeName.ESSAY);

        // CategoryQuestion
        CategoryQuestion category1 = new CategoryQuestion(1, "Java");
        CategoryQuestion category2 = new CategoryQuestion(2, "SQL");
        CategoryQuestion category3 = new CategoryQuestion(3, "Postman");

        // Question
        Question question1 = new Question(1, "What is OOP in Java?", category1, type1, acc1, new Date());

        Question question2 = new Question(2, "Which SQL command is used to get data from a table?", category2, type2, acc2, new Date());

        Question question3 = new Question(3, "What is the purpose of Postman?", category3, type1, acc3, new Date());

        // Answer
        Answer answer1 = new Answer(1, "OOP is Object Oriented Programming.", question1, true);

        Answer answer2 = new Answer(2, "SELECT is used to get data from a table.", question2, true);

        Answer answer3 = new Answer(3, "Postman is used to test APIs.", question3, true);

        // Exam
        Exam exam1 = new Exam(1, "JAVA001", "Java Core Exam", category1, 60, acc1, new Date());

        Exam exam2 = new Exam(2, "SQL001", "SQL Basic Exam", category2, 45, acc2, new Date());

        Exam exam3 = new Exam(3, "API001", "Postman API Testing Exam", category3, 30, acc3, new Date());

        // ExamQuestion
        ExamQuestion examQuestion1 = new ExamQuestion(exam1, question1);
        ExamQuestion examQuestion2 = new ExamQuestion(exam2, question2);
        ExamQuestion examQuestion3 = new ExamQuestion(exam3, question3);

        // Print data
        System.out.println("===== DEPARTMENT =====");
        System.out.println(dep1.getDepartmentName());
        System.out.println(dep2.getDepartmentName());
        System.out.println(dep3.getDepartmentName());

        System.out.println("\n===== POSITION =====");
        System.out.println(pos1.getPositionName());
        System.out.println(pos2.getPositionName());
        System.out.println(pos3.getPositionName());

        System.out.println("\n===== ACCOUNT =====");
        System.out.println(acc1.getFullName() + " - " + acc1.getEmail());
        System.out.println(acc2.getFullName() + " - " + acc2.getEmail());
        System.out.println(acc3.getFullName() + " - " + acc3.getEmail());

        System.out.println("\n===== GROUP =====");
        System.out.println(group1.getGroupName());
        System.out.println(group2.getGroupName());
        System.out.println(group3.getGroupName());

        System.out.println("\n===== GROUP ACCOUNT =====");
        System.out.println(groupAccount1.getAccount().getUsername() + " joined " + groupAccount1.getGroup().getGroupName());
        System.out.println(groupAccount2.getAccount().getUsername() + " joined " + groupAccount2.getGroup().getGroupName());
        System.out.println(groupAccount3.getAccount().getUsername() + " joined " + groupAccount3.getGroup().getGroupName());

        System.out.println("\n===== TYPE QUESTION =====");
        System.out.println(type1.getTypeName());
        System.out.println(type2.getTypeName());
        System.out.println(type3.getTypeName());

        System.out.println("\n===== CATEGORY QUESTION =====");
        System.out.println(category1.getCategoryName());
        System.out.println(category2.getCategoryName());
        System.out.println(category3.getCategoryName());

        System.out.println("\n===== QUESTION =====");
        System.out.println(question1.getContent());
        System.out.println(question2.getContent());
        System.out.println(question3.getContent());

        System.out.println("\n===== ANSWER =====");
        System.out.println(answer1.getContent() + " - Correct: " + answer1.isCorrect());
        System.out.println(answer2.getContent() + " - Correct: " + answer2.isCorrect());
        System.out.println(answer3.getContent() + " - Correct: " + answer3.isCorrect());

        System.out.println("\n===== EXAM =====");
        System.out.println(exam1.getTitle());
        System.out.println(exam2.getTitle());
        System.out.println(exam3.getTitle());

        System.out.println("\n===== EXAM QUESTION =====");
        System.out.println(examQuestion1.getExam().getTitle() + " - " + examQuestion1.getQuestion().getContent());
        System.out.println(examQuestion2.getExam().getTitle() + " - " + examQuestion2.getQuestion().getContent());
        System.out.println(examQuestion3.getExam().getTitle() + " - " + examQuestion3.getQuestion().getContent());
    }
}