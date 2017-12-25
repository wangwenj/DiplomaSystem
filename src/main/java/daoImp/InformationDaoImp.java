/**
 * 2017/12/25/23:42
 */
package daoImp;

import dao.DAO;
import dao.InformationDao;
import entity.InformationEntity;
import org.apache.commons.lang3.ObjectUtils;

import java.util.ArrayList;
import java.util.List;

public class InformationDaoImp extends DAO<InformationEntity> implements InformationDao{
    @Override
    public List<InformationEntity> getAll(int ID) {
        String sql1 = "select * from VIEW_ORGAPPLY where STATE = 1 and ID_USER = ?";
        List list1 = getForList(sql1,ID);
        System.out.println(list1);
        String sql2 = "select * from VIEW_PROAPPLY where STATE = 1 and ID_USER = ?";
        List list2 = getForList(sql2,ID);
        System.out.println(list2);
        List list = new ArrayList();
        list.addAll(list1);
        list.addAll(list2);
        System.out.println(list);
//        System.out.println("list1:"+list1.size()+"list2:"+list2.size());
//        while(list1.size() != 0 || list2.size() != 0){
//            InformationEntity info1 = (InformationEntity) list1.get(0);
//            InformationEntity info2 = (InformationEntity) list2.get(0);
//            if(list2.size() !=  0 && list1.size() !=0){
//                if(info1.getdate().compareTo(info2.getdate()) == 1 && info1.getdate().compareTo(info2.getdate()) == 0){
//                    list.add(info2);
//                    list2.remove(0);
//                }
//                else if(info1.getdate().compareTo(info2.getdate()) == -1){
//                    list.add(info1);
//                    list1.remove(0);
//                }
//            }
//            else if(list1.size() == 0 || list2.size() == 0){
//                if(list1.size() == 0){
//                    list.addAll(list2);
//                    list2.clear();
//                }
//                else if(list2.size() == 0){
//                    list.addAll(list1);
//                    list1.clear();
//                }
//            }
//        }
        return list;
    }

    @Override
    public void accept(Integer ID_ORGANIZATION, Integer ID_PROJECT, int ID_USER) {
        if(ID_ORGANIZATION != null) {
            String sql = "update ORG_USER_APPLY set STATE=0 where ID_ORGANIZATION=? and ID_USER=?";
            update(sql,ID_ORGANIZATION,ID_USER);
        }
        if(ID_PROJECT != null) {
            String sql = "update PROJECT_APPLY set STATE=0 where ID_PROJECT=? and ID_USER=?";
            update(sql,ID_PROJECT,ID_USER);
        }
    }
    @Override
    public void refuse(Integer ID_ORGANIZATION, Integer ID_PROJECT, int ID_USER) {
        if(ID_ORGANIZATION != null) {
            String sql = "update ORG_USER_APPLY set STATE=-1 where ID_ORGANIZATION=? and ID_USER=?";
            update(sql,ID_ORGANIZATION,ID_USER);
        }
        if(ID_PROJECT != null) {
            String sql = "update PROJECT_APPLY set STATE=-1 where ID_PROJECT=? and ID_USER=?";
            update(sql,ID_PROJECT,ID_USER);
        }
    }
}
