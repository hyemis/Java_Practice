package kr.co.demo02;

import java.util.Objects;

public class Person {

		private String name;
		private int age;
		private char gender;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getAge() {
			return age;
		}
		public void setAge(int age) {
			this.age = age;
		}
		public char getGender() {
			return gender;
		}
		public void setGender(char gender) {
			this.gender = gender;
		}
		// source genarate 로 편하게 만들 수 있다. 
		@Override
		public String toString() {
			return "Person [name=" + name + ", age=" + age + ", gender=" + gender + "]";
		}
		
		@Override
		public int hashCode() {
			return Objects.hash(age, gender, name);
		}
		
		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			Person other = (Person) obj;
			return age == other.age && gender == other.gender && Objects.equals(name, other.name);
		}
		
		/*
		@Override
		public String toString() {
			return String.format("Person[name: %s, age: %d]", this.name, this.age);
		}
		// 접근제한자 반환타입 메서드 이름 
		// 이름만 가지고 person객체 비교 
		@Override
		public boolean equals(Object obj) {
			Person person = (Person)obj; // 매개변수로 받은 obj를 다운캐스팅해서 person으로 변환시켜 작업
			if(name.equals(person.getName()) && 
					age == person.getAge() &&
					gender == person.getGender()) {
				return true;
			}
			return false;
		}
*/		
}


		
		
