import { NotFound } from 'lin-mizar';
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
  async createType () {

  }

  // 删除地址
  async deleteType (id) {
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
