package org.handsome.service;

import org.handsome.base.BaseService;
import org.handsome.dao.TaskMapper;
import org.handsome.entity.Task;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by June on 2017/5/28.
 */
@Transactional(rollbackFor = Exception.class)
@Service
public class TaskServiceImpl extends BaseService implements TaskService {

    private static TaskMapper taskMapper = null;

    private void setMapper() {
        if (taskMapper == null)
            taskMapper = sqlSessionTemplate.getMapper(TaskMapper.class); // 获取相关mapper
    }

    @Override
    public List<Task> findAll() {
        setMapper();
        return taskMapper.selectAll();
    }
}
