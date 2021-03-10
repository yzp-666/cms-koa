import { NotFound, Forbidden } from 'lin-mizar';
import Sequelize from 'sequelize';
import { Client } from '../model/client';

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
        console.log(1)
        const clients = await Client.findAll();
        return clients;
    }
}

export { ClientDao };
