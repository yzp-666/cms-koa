import { LinRouter, disableLoading } from 'lin-mizar';
import { groupRequired } from '../../middleware/jwt'; // 权限判断
import {
  CreateOrUpdateSupplierValidator, // 客户创建参数验证
  SupplierListValidator, // 列表查询参数验证
  OrUpdateSupplierTypeValidator // 客户类型参数验证
} from '../../validator/supplier'; // 自定义验证
import { PositiveIdValidator } from '../../validator/common'; // 参数验证
//
// import { getSafeParamId } from '../../lib/util'; // 验证id
// import { BookNotFound } from '../../lib/exception'; // 异常
import { SupplierDao } from '../../dao/supplier';
import { SupplierTypeDao } from '../../dao/supplierType';
import { getSafeParamId } from "../../lib/util";

// Supplier 的红图实例
const supplierApi = new LinRouter({
  prefix: '/v1/supplier',
  module: '客户'
});

// dao 数据库访问层实例
const supplierDao = new SupplierDao();

supplierApi.linGet(
  'getSuppliers',
  '/',
  supplierApi.permission('查询所有客户'),
  groupRequired,
  async ctx => {
    // 校验查询的参数
    const v = await new SupplierListValidator().validate(ctx);
    const suppliers = await supplierDao.getSuppliers(v.get('query'));
    ctx.json(suppliers);
  });

// 根据id查询单个客户
supplierApi.get('/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  const id = v.get('path.id');
  const res = await supplierDao.getSupplier(id);
  ctx.json(res);
});

supplierApi.post('/', async ctx => {
  const v = await new CreateOrUpdateSupplierValidator().validate(ctx);
  await supplierDao.createSupplier(v);
  ctx.success({
    code: 12
  });
});

supplierApi.linPut(
  'editSupplier',
  '/:id',
  supplierApi.permission('编辑客户'),
  groupRequired,
  async ctx => {
    const v = await new CreateOrUpdateSupplierValidator().validate(ctx);
    const id = getSafeParamId(ctx);
    await supplierDao.updateSupplier(v, id);
    ctx.success({
      code: 13
    });
  });

supplierApi.linDelete(
  'deleteSupplier',
  '/delete/:id',
  supplierApi.permission('删除客户'),
  groupRequired,
  async ctx => {
    const v = await new PositiveIdValidator().validate(ctx);
    const id = v.get('path.id');
    await supplierDao.deleteSupplier(id);
    ctx.success({
      code: 14
    });
  }
);

// supplier 的红图实例
const supplierTypeApi = new LinRouter({
  prefix: '/v1/supplier_type',
  module: '客户类型'
});
// supplierType 的dao 数据库访问层实例
const supplierTypeDao = new SupplierTypeDao();

// 获取类型列表
supplierTypeApi.get('/', async ctx => {
  const res = await supplierTypeDao.getTypeList();
  ctx.json(res);
});

// 创建新类型
supplierTypeApi.post('/', async ctx => {
  const v = await new OrUpdateSupplierTypeValidator().validate(ctx);
  const res = await supplierTypeDao.createType(v);
  ctx.body = {
    message: "新建成功",
    code: 12,
    data: res
  }
});

// 删除类型
supplierTypeApi.linDelete(
  'deleteSupplierType',
  '/delete/:id',
  supplierTypeApi.permission('删除类客户型'),
  groupRequired,
  async ctx => {
    // TODO 删除客户类型前先检测是否有客户使用该类型
    const v = await new PositiveIdValidator().validate(ctx);
    const id = v.get('path.id');
    console.log(id);
    await supplierTypeDao.deleteType(id);
    ctx.success({
      code: 14
    });
  }
);

module.exports = { supplierApi, supplierTypeApi, [disableLoading]: false };
