// demo 的红图实例
import { disableLoading, LinRouter, NotFound } from 'lin-mizar';
import { DemoDao } from '../../dao/demo';
import { PositiveIdValidator } from '../../validator/common'; // id验证
import { SearchValidator, CreateOrUpdataValidator } from '../../validator/demo';
import { getSafeParamId, success } from '../../lib/util';
import { groupRequired } from '../../middleware/jwt';

const demoApi = new LinRouter({
  prefix: '/v1/demo',
  module: 'demo'
});

// demo 的dao 数据库访问层实例
const demoDto = new DemoDao();

/*
 *@method getID
 *@param{id} demoID
 *@return {deta} demoDetail
*/
demoApi.get('/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  const id = v.get('path.id');
  const demo = await demoDto.getId(id);
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
demoApi.linGet(
  'getList',
  '/',
  demoApi.permission('查询demo列表'),
  groupRequired,
  async ctx => {
    // 校验查询的参数
    const v = await new SearchValidator().validate(ctx);
    const list = await demoDto.getList(v.get('query'));
    success(ctx, list)
  });

/*
 *@method Create
 *@param{ data }
 *@return {}
*/
demoApi.post('/', async ctx => {
  const v = await new CreateOrUpdataValidator().validate(ctx);
  await demoDto.create(v);
  ctx.success({
    code: 12 // 新建成功
  });
});

/*
 *@method UpData
 *@param{ data }
 *@return {}
*/
demoApi.put('/:id', async ctx => {
  const v = await new CreateOrUpdataValidator().validate(ctx);
  const id = getSafeParamId(ctx);
  await demoDto.updata(v, id);
  ctx.success({
    code: 13
  });
});

/*
 *@method Delete
 *@param{ data }
 *@return {}
*/
// demoApi.linDelete(
//   'delete',
//   '/:id',
//   demoApi.permission('删除数据'),
//   groupRequired,
//   async ctx => {
//     const v = await new PositiveIdValidator().validate(ctx);
//     const id = v.get('path.id');
//     await demoDto.delete(id);
//     ctx.success({
//       code: 14
//     });
//   }
// );

/*
 *@method Deletes
 *@param{ ids }
 *@return {}
*/
demoApi.linPost(
  'delete',
  '/delete',
  demoApi.permission('删除数据'),
  groupRequired,
  async ctx => {
    const v = await new PositiveIdValidator().validate(ctx);
    const id = v.get('body.id');
    const ids = v.get('body.ids');
    await demoDto.delete(id, ids);
    ctx.success({
      code: 14
    });
  }
);

module.exports = { demoApi, [disableLoading]: false };
