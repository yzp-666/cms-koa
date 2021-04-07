import { LinRouter, disableLoading } from 'lin-mizar';
import { groupRequired } from '../../middleware/jwt'; // 权限判断
import {
  UpdateValidator, // 客户创建参数验证
  ListValidator, // 列表查询参数验证
  AllValidator
} from '../../validator/product'; // 自定义验证
import { PositiveIdValidator } from '../../validator/common'; // 参数验证

import { ProductDao } from '../../dao/Product';
import { getSafeParamId, success } from "../../lib/util";

// product 的红图实例
const productApi = new LinRouter({
  prefix: '/v1/product',
  module: '产品'
});

// dao 数据库访问层实例
const productDao = new ProductDao();

productApi.linGet(
  'getProductList',
  '/',
  productApi.permission('查询产品列表'),
  groupRequired,
  async ctx => {
    // 校验查询的参数
    const v = await new ListValidator().validate(ctx);
    const clients = await productDao.getProducts(v.get('query'));
    success(ctx, clients)
  });

productApi.linGet(
  'getProductAll',
  '/all',
  productApi.permission('查询所有产品'),
  groupRequired,
  async ctx => {
    // 校验查询的参数
    const v = await new AllValidator().validate(ctx);
    const clients = await productDao.getAllProducts(v.get('query'));
    success(ctx, clients)
  });

// 根据id查询单个商品
productApi.get('/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  const id = v.get('path.id');
  const res = await productDao.getProduct(id);
  ctx.json(res);
});

productApi.post('/', async ctx => {
  const v = await new UpdateValidator().validate(ctx);
  await productDao.createProduct(v);
  ctx.success({
    code: 12
  });
});

productApi.linPut(
  'editClient',
  '/:id',
  productApi.permission('编辑产品'),
  groupRequired,
  async ctx => {
    const v = await new UpdateValidator().validate(ctx);
    const id = getSafeParamId(ctx);
    await productDao.updateProduct(v, id);
    ctx.success({
      code: 13
    });
  });

productApi.linDelete(
  'deleteClient',
  '/delete/:id',
  productApi.permission('删除产品'),
  groupRequired,
  async ctx => {
    const v = await new PositiveIdValidator().validate(ctx);
    const id = v.get('path.id');
    await productDao.deleteProduct(id);
    ctx.success({
      code: 14
    });
  }
);

module.exports = { productApi, [disableLoading]: false };
