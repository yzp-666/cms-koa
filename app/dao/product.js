import { NotFound, Forbidden } from 'lin-mizar';
import { Product } from '../model/product';

class ProductDao {
  // 根据id 获取信息
  async getProduct (id) {
    const product = await Product.findOne({
      where: {
        id
      }
    });
    return product;
  }

  async getAllProducts () {
    const product = await Product.findAll()
    return product
  }

  // 获取列表
  async getProducts (data) {
    // TODO 添加验证参数
    // data 查询条件
    const products = await Product.findAndCountAll({
      limit: data.pageSize - 0,
      offset: (data.currentPage - 1) * (data.pageSize)
    });
    return products;
  }

  // 创建客户
  async createProduct (v) {
    const products = await Product.findOne({
      where: {
        name: v.get('body.name'),
        code: v.get('body.code')
      }
    });
    if (products) {
      throw new Forbidden({
        code: 10243
      });
    }
    const product = new Product();
    product.code = v.get('body.code');
    product.name = v.get('body.name');
    product.unit = v.get('body.unit');
    product.price = v.get('body.price');
    product.types = JSON.stringify(v.get('body.types'));
    product.remark = v.get('body.remark');
    await product.save();
  }

  // 编辑
  async updateProduct (v, id) {
    const product = await Product.findByPk(id);
    if (!product) {
      throw new NotFound({
        code: 20026
      });
    }
    console.log(product);
    product.code = v.get('body.code');
    product.name = v.get('body.name');
    product.unit = v.get('body.unit');
    product.price = v.get('body.price');
    product.types = JSON.stringify(v.get('body.types'));
    product.remark = v.get('body.remark');
    await product.save();
  }

  // 删除客户
  async deleteProduct (id) {
    const product = await Product.findOne({
      where: {
        id
      }
    });
    if (!product) {
      throw new NotFound({
        code: 20026
      });
    }
    product.destroy();
  }
}

export { ProductDao };
