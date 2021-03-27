import { NotFound, Forbidden } from 'lin-mizar';
import { Supplier } from '../model/supplier';

// import { Address } from '../model/address'

class SupplierDao {
  // 根据id 获取信息
  async getSupplier (id) {
    const supplier = await Supplier.findOne({
      where: {
        id
      }
    });
    return supplier;
  }

  // 获取列表
  async getSuppliers (data) {
    // TODO 添加验证参数
    const suppliers = await Supplier.findAndCountAll({
      limit: data.pageSize - 0,
      offset: (data.currentPage - 1) * (data.pageSize)
    });
    // clients.total =
    return suppliers;
  }

  // 创建客户
  async createSupplier (v) {
    const suppliers = await Supplier.findOne({
      where: {
        name: v.get('body.name')
      }
    });
    if (suppliers) {
      throw new Forbidden({
        code: 10241
      });
    }
    const supplier = new Supplier();
    supplier.name = v.get('body.name');
    supplier.typeId = v.get('body.typeId'); // 客户分类
    supplier.phone = v.get('body.phone'); // 电话
    supplier.byPhone = v.get('body.byPhone'); // 备用电话
    supplier.htje = v.get('body.htje'); // 期初欠款
    supplier.address = v.get('body.address'); // 默认地址
    supplier.email = v.get('body.email'); // 邮箱
    supplier.remark = v.get('body.remark'); // 备注
    supplier.fax = v.get('body.fax'); // 传真
    await supplier.save();
  }

  // 编辑客户
  async updateSupplier (v, id) {
    const supplier = await Supplier.findByPk(id);
    if (!supplier) {
      throw new NotFound({
        code: 20022
      });
    }
    supplier.name = v.get('body.name');
    supplier.typeId = v.get('body.typeId'); // 客户分类
    supplier.phone = v.get('body.phone'); // 电话
    supplier.byPhone = v.get('body.byPhone'); // 备用电话
    supplier.htje = v.get('body.htje'); // 期初欠款
    supplier.address = v.get('body.address'); // 地址
    supplier.email = v.get('body.email'); // 邮箱
    supplier.remark = v.get('body.remark'); // 备注
    supplier.fax = v.get('body.fax'); // 传真
    await supplier.save();
  }

  // 删除客户
  async deleteSupplier (id) {
    const supplier = await Supplier.findOne({
      where: {
        id
      }
    });
    if (!supplier) {
      throw new NotFound({
        code: 20022
      });
    }
    supplier.destroy();
  }
}

export { SupplierDao };
