package com.mbti.answer.model.dto;


import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class TestAnswer {
    private Long questionId;
    private String selectedOption; // 'A' or 'B'
}