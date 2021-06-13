// 客户 的红图实例
import { disableLoading, LinRouter, NotFound } from 'lin-mizar';
import { KehuDao } from '../../dao/kehu';
import { PositiveIdValidator, PaginateDeleteValidator } from '../../validator/common'; // id, ids验证
import { SearchValidator, CreateOrUpdataValidator } from '../../validator/demo';
import { getSafeParamId, success } from '../../lib/util';
import { groupRequired } from '../../middleware/jwt'; // 权限鉴定
import { logger } from '../../middleware/logger';

const kehuApi = new LinRouter({
  prefix: '/v1/client',
  module: 'client'
});

// demo 的dao 数据库访问层实例
const kehuDao = new KehuDao();

/*
 *@method getID
 *@param{id} demoID
 *@return {deta} demoDetail
*/
kehuApi.get('/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  const id = v.get('path.id');
  const demo = await kehuDao.getId(id);
  if (!demo) {
    throw new NotFound({
      code: 10022
    });
  }
  success(ctx, demo)
});

/*
 *@method List
 *@param{ currentPage, pageSize }
 *@return {list} demoList
*/
kehuApi.linGet(
  'getList',
  '/',
  kehuApi.permission('查询客户列表'),
  groupRequired,
  async ctx => {
    // 校验查询的参数
    const v = await new SearchValidator().validate(ctx);
    const list = await kehuDao.getList(v.get('query'));
    success(ctx, list)
  });

/*
 *@method Create
 *@param{ data }
 *@return {}
*/
kehuApi.linPost(
  'DemoCreate',
  '/',
  kehuApi.permission('新建客户'),
  logger('新建客户'),
  groupRequired,
  async ctx => {
    const v = await new CreateOrUpdataValidator().validate(ctx);
    await kehuDao.create(v);
    ctx.success({
      code: 12 // 新建成功
    });
  }
);

/*
 *@method UpData
 *@param{ data }
 *@return {}
*/
kehuApi.linPut(
  'DemoPut',
  '/:id',
  kehuApi.permission('编辑客户'),
  logger('编辑客户'),
  groupRequired,
  async ctx => {
    const v = await new CreateOrUpdataValidator().validate(ctx);
    const id = getSafeParamId(ctx);
    await kehuDao.updata(v, id);
    ctx.success({
      code: 13
    });
  }
);

/*
 *@method Delete
 *@param{ data }
 *@return {}
*/
kehuApi.linDelete(
  'DemoDelete',
  '/delete',
  kehuApi.permission('删除客户'),
  logger('删除客户'),
  groupRequired,
  async ctx => {
    const v = await new PaginateDeleteValidator().validate(ctx);
    const ids = v.get('body.ids');
    await kehuDao.delete(ids);
    ctx.success({
      code: 14
    });
  }
);

module.exports = { kehuApi, [disableLoading]: false };
