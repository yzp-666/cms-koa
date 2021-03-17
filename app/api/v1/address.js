import { LinRouter, NotFound, disableLoading } from 'lin-mizar';

import { PositiveIdValidator } from '../../validator/common';

import { AddressDao } from '../../dao/address';

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

module.exports = { addressApi, [disableLoading]: false };
