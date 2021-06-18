// 供应商 的红图实例
import { disableLoading, LinRouter, NotFound } from 'lin-mizar';
import { GysDao } from '../../dao/gys';
import { PositiveIdValidator, PaginateDeleteValidator } from '../../validator/common'; // id, ids验证
import { SearchValidator, CreateOrUpdataValidator } from '../../validator/demo';
import { getSafeParamId, success } from '../../lib/util';
import { groupRequired } from '../../middleware/jwt'; // 权限鉴定
import { logger } from '../../middleware/logger';

const gysApi = new LinRouter({
  prefix: '/v1/supplier',
  module: 'supplier'
});

// demo 的dao 数据库访问层实例
const gysDao = new GysDao();

/*
 *@method getID
 *@param{id} demoID
 *@return {deta} demoDetail
*/
gysApi.get('/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  const id = v.get('path.id');
  const demo = await gysDao.getId(id);
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
gysApi.linGet(
  'gysList',
  '/',
  gysApi.permission('查询供应商列表'),
  groupRequired,
  async ctx => {
    // 校验查询的参数
    const v = await new SearchValidator().validate(ctx);
    const list = await gysDao.getList(v.get('query'));
    success(ctx, list)
  });

/*
 *@method Create
 *@param{ data }
 *@return {}
*/
gysApi.linPost(
  'gysCreate',
  '/',
  gysApi.permission('新建供应商'),
  logger('新建供应商'),
  groupRequired,
  async ctx => {
    const v = await new CreateOrUpdataValidator().validate(ctx);
    await gysDao.create(v);
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
gysApi.linPut(
  'gysPut',
  '/:id',
  gysApi.permission('编辑供应商'),
  logger('编辑供应商'),
  groupRequired,
  async ctx => {
    const v = await new CreateOrUpdataValidator().validate(ctx);
    const id = getSafeParamId(ctx);
    await gysDao.updata(v, id);
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
gysApi.linDelete(
  'gysDelete',
  '/delete',
  gysApi.permission('删除供应商'),
  logger('删除供应商'),
  groupRequired,
  async ctx => {
    const v = await new PaginateDeleteValidator().validate(ctx);
    const ids = v.get('body.ids');
    await gysDao.delete(ids);
    ctx.success({
      code: 14
    });
  }
);

module.exports = { gysApi, [disableLoading]: false };
