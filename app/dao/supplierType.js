import { NotFound, Forbidden } from 'lin-mizar';
import { SupplierType } from '../model/supplierType';

class SupplierTypeDao {
  // 获取列表
  async getTypeList () {
    const typeList = await SupplierType.findAll();
    return typeList;
  }

  // 创建
  async createType (v) {
    const verify = await SupplierType.findOne({
      where: {
        name: v.get('body.name')
      }
    });
    if (verify) {
      throw new Forbidden({
        code: 10242
      });
    }
    const supplierType = new SupplierType();
    supplierType.name = v.get('body.name');
    await supplierType.save();
    let newType = supplierType.dataValues
    delete newType.update_time
    delete newType.create_time
    return {
      value: newType.id,
      label: newType.name
    }
  }

  // 删除
  async deleteType (id) {
    const supplierType = await SupplierType.findOne({
      where: {
        id
      }
    });
    if (!supplierType) {
      throw new NotFound({
        code: 20023
      });
    }
    supplierType.destroy();
  }
}

export { SupplierTypeDao };
