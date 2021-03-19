import { LinRouter, NotFound, disableLoading } from 'lin-mizar';

import { PositiveIdValidator } from '../../validator/common';

import { AddressDao } from '../../dao/address';
import { CreateAddressValidator, UpDataAddressValidator } from "../../validator/address";
import { getSafeParamId } from "../../lib/util";

// book 的红图实例
const addressApi = new LinRouter({
  prefix: '/v1/address',
  module: '地址管理'
});

// book 的dao 数据库访问层实例
const addressDto = new AddressDao();

addressApi.get('/:id', async ctx => {
  const v = await new PositiveIdValidator().validate(ctx);
  const id = v.get('path.id');
  const addressList = await addressDto.getAddressList(id);
  if (!addressList) {
    ctx.json([]);
  }
  ctx.json(addressList);
});

addressApi.post('/', async ctx => {
  const v = await new CreateAddressValidator().validate(ctx);
  await addressDto.createAddress(v);
  ctx.success({
    code: 12
  });
});

addressApi.put('/:id', async ctx => {
  const v = await new UpDataAddressValidator().validate(ctx);
  const id = getSafeParamId(ctx);
  await addressDto.updateAddress(v, id);
  ctx.success({
    code: 13
  });
});

module.exports = { addressApi, [disableLoading]: false };
