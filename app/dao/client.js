import { NotFound, Forbidden } from 'lin-mizar';
import Sequelize from 'sequelize';
import { Client } from '../model/client';
import {Book} from "../model/book";

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
    async getClients () {
        const clients = await Client.findAll();
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
        /*
        * 客户分类id (表) type
        * 获取 addressList 填入 地址表并返回 ID数组 / 合并 ID 并用 ',' 隔开
        */
        client.name = v.get('body.name');
        client.typeId = v.get('body.typeId'); // 客户分类
        client.phone = v.get('body.phone'); // 电话
        client.byPhone = v.get('body.byPhone'); // 备用电话
        client.htje = v.get('body.htje'); // 期初欠款
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
