package project.star.b2.service;

import java.util.List;

import project.star.b2.model.FakeRoom;

public interface FakeService {
	 public int addFake(FakeRoom input) throws Exception;

	 public List<FakeRoom> getFakeItem(FakeRoom input) throws Exception;
	 
	 public List<FakeRoom> getFakeList(FakeRoom input) throws Exception;

	}
