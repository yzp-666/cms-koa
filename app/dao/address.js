import { Forbidden, NotFound } from 'lin-mizar';
import { Address } from '../model/address';

class AddressDao {
  /**
   * 获取用户地址
   * parems:{usrId: 1}
   * @returns {addressList}
   */
  async getAddressList (id) {
    const address = await Address.findAll({
      where: {
        user_id: id
      }
    })
    return address;
  }

  // 创建地址
  async createAddress (v) {
    const address = await Address.findOne({
      where: {
        user_id: v.get('body.user_id')
      }
    });
    if (address && address.length > 5) {
      throw new Forbidden({
        code: 20025
      });
    }
    const msg = new Address();
    msg.firm_name = v.get('body.firm_name');
    msg.address = v.get('body.address');
    msg.linkman = v.get('body.linkman');
    msg.link_phone = v.get('body.link_phone');
    msg.remark = v.get('body.remark');
    msg.user_id = v.get('body.user_id');
    await msg.save();
  }

  async updateAddress (v, id) {
    const address = await Address.findByPk(id);
    if (!address) {
      throw new NotFound({
        code: 20024
      });
    }
    address.firm_name = v.get('body.firm_name');
    address.address = v.get('body.address');
    address.linkman = v.get('body.linkman');
    address.link_phone = v.get('body.link_phone');
    address.remark = v.get('body.remark');
    address.user_id = v.get('body.user_id');
    await address.save();
  }

  // 删除地址
  async deleteAddress (id) {
    const address = await Address.findOne({
      where: {
        id
      }
    });
    if (!address) {
      throw new NotFound({
        code: 20024
      });
    }
    address.destroy();
  }
}

export { AddressDao };
