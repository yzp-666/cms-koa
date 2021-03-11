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
        client.name = v.get('body.name');
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
