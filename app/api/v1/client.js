import { LinRouter, NotFound, disableLoading } from 'lin-mizar';
import { groupRequired } from '../../middleware/jwt'; // 权限判断
import {
    CreateOrUpdateClientValidator,
    OrUpdateClientTypeValidator
} from '../../validator/client'; // 自定义验证
import { PositiveIdValidator } from '../../validator/common'; // 参数验证
//
// import { getSafeParamId } from '../../lib/util'; // 验证id
// import { BookNotFound } from '../../lib/exception'; // 异常
import { ClientDao } from '../../dao/client';
import { ClientTypeDao } from '../../dao/clientType';
import {log} from "../cms/log";

// client 的红图实例
const clientApi = new LinRouter({
    prefix: '/v1/client',
    module: '客户'
});

// dao 数据库访问层实例
const clientDao = new ClientDao();

clientApi.linGet(
    'getClient',
    '/',
    clientApi.permission('查询所有客户'),
    groupRequired,
    async ctx => {
        const clients = await clientDao.getClients();
        console.log(clients);
        ctx.json(clients);
});

clientApi.post('/', async ctx => {
    const v = await new CreateOrUpdateClientValidator().validate(ctx);
    await clientDao.createClient(v);
    ctx.success({
        code: 12
    });
});

clientApi.linDelete(
    'deleteClient',
    '/delete/:id',
    clientApi.permission('删除客户'),
    groupRequired,
    async ctx => {
        const v = await new PositiveIdValidator().validate(ctx);
        const id = v.get('path.id');
        await clientDao.deleteClient(id);
        ctx.success({
            code: 14
        });
    }
);

// client 的红图实例
const clientTypeApi = new LinRouter({
    prefix: '/v1/client_type',
    module: '客户类型'
});
// clientType 的dao 数据库访问层实例
const clientTypeDao = new ClientTypeDao();

// 获取类型列表
clientTypeApi.get('/', async ctx => {
    const res = await clientTypeDao.getTypeList();
    ctx.json(res);
});

// 创建新类型
clientTypeApi.post('/', async ctx => {
    const v = await new OrUpdateClientTypeValidator().validate(ctx);
    await clientTypeDao.createType(v);
    ctx.success({
        code: 12
    });
});

// 删除类型
clientTypeApi.linDelete(
    'deleteClientType',
    '/delete/:id',
    clientTypeApi.permission('删除类客户型'),
    groupRequired,
    async ctx => {
        const v = await new PositiveIdValidator().validate(ctx);
        const id = v.get('path.id');
        console.log(id);
        await clientTypeDao.deleteType(id);
        ctx.success({
            code: 14
        });
    }
);

module.exports = { clientApi, clientTypeApi, [disableLoading]: false };
