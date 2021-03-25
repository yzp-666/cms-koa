import {NotFound, Forbidden} from 'lin-mizar';
import {ClientType} from '../model/clientType';

class ClientTypeDao {

  // 获取列表
  async getTypeList() {
    const typeList = await ClientType.findAll();
    return typeList;
  }

  // 创建
  async createType(v) {
    const verify = await ClientType.findOne({
      where: {
        name: v.get('body.name')
      }
    });
    if (verify) {
      throw new Forbidden({
        code: 10242
      });
    }
    const clientType = new ClientType();
    clientType.name = v.get('body.name');
    await clientType.save();
    console.log(clientType.dataValues);
    let newType = clientType.dataValues
    delete newType.update_time
    delete newType.create_time
    return {
      value: newType.id,
      label: newType.name
    }
  }

  // 删除
  async deleteType(id) {
    const clientType = await ClientType.findOne({
      where: {
        id
      }
    });
    if (!clientType) {
      throw new NotFound({
        code: 20023
      });
    }
    clientType.destroy();
  }
}

export {ClientTypeDao};
