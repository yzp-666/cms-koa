import { NotFound, Forbidden } from 'lin-mizar';
import { Client } from '../model/client';

// import { Address } from '../model/address'

class ClientDao {
  // 根据id 获取信息
  async getClient (id) {
    const client = await Client.findOne({
      where: {
        id
      }
    });
    return client;
  }

  // 获取列表
  async getClients (data) {
    // TODO 添加验证参数
    const clients = await Client.findAndCountAll({
      limit: data.pageSize - 0,
      offset: (data.currentPage - 1) * (data.pageSize)
    });
    // clients.total =
    return clients;
  }

  // 创建客户
  async createClient (v) {
    const clients = await Client.findOne({
      where: {
        name: v.get('body.name')
      }
    });
    if (clients) {
      throw new Forbidden({
        code: 10241
      });
    }
    const client = new Client();
    client.name = v.get('body.name');
    client.typeId = v.get('body.typeId'); // 客户分类
    client.phone = v.get('body.phone'); // 电话
    client.byPhone = v.get('body.byPhone'); // 备用电话
    client.htje = v.get('body.htje'); // 期初欠款
    // client.address = v.get('body.address'); // 默认地址
    client.email = v.get('body.email'); // 邮箱
    client.remark = v.get('body.remark'); // 备注
    client.fax = v.get('body.fax'); // 传真
    await client.save();
  }

  // 编辑客户
  async updateClient (v, id) {
    const client = await Client.findByPk(id);
    if (!client) {
      throw new NotFound({
        code: 20022
      });
    }
    client.name = v.get('body.name');
    client.typeId = v.get('body.typeId'); // 客户分类
    client.phone = v.get('body.phone'); // 电话
    client.byPhone = v.get('body.byPhone'); // 备用电话
    client.htje = v.get('body.htje'); // 期初欠款
    client.address = v.get('body.address'); // 地址
    client.email = v.get('body.email'); // 邮箱
    client.remark = v.get('body.remark'); // 备注
    client.fax = v.get('body.fax'); // 传真
    await client.save();
  }

  // 删除客户
  async deleteClient (id) {
    const client = await Client.findOne({
      where: {
        id
      }
    });
    if (!client) {
      throw new NotFound({
        code: 20022
      });
    }
    client.destroy();
  }
}

export { ClientDao };
