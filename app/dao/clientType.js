import { NotFound, Forbidden } from 'lin-mizar';
import Sequelize from 'sequelize';
import { ClientType } from '../model/clientType';
import {Book} from "../model/book";

class ClientDao {

    // 获取列表
    async getTypeList () {
        const typeList = await ClientType.findAll();
        return typeList;
    }

    // 创建
    async createType (v) {
        const ClientType = await ClientType.findOne({
            where: {
                typeName: v.get('body.typeName')
            }
        });
        if (ClientType) {
            throw new Forbidden({
                code: 10242
            });
        }
        const clientType = new ClientType();
        clientType.typeName = v.get('body.typeName');
        await clientType.save();
    }

    // 删除
    async deleteType (id) {
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

export { ClientDao };
