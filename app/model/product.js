// 产品model
import { InfoCrudMixin } from 'lin-mizar';
import { merge } from 'lodash';
import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';

class Product extends Model {
  toJSON () {
    const origin = {
      id: this.id,
      img_url: this.img_url, // 封面图
      trade_code: this.trade_code, // 编号
      trade_name: this.trade_name, // 品名
      unit: this.unit, // 单位
      breadth: this.breadth, // 幅宽
      grammage: this.grammage, // 克重
      sale_price: this.sale_price, // 售价
      purchase_price: this.purchase_price, // 进价
      remark: this.remark // 备注
    };
    return origin;
  }
}

Product.init(
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    img_url: {
      type: Sequelize.STRING(200),
      allowNull: true
    },
    trade_code: {
      type: Sequelize.STRING(50),
      allowNull: true
    },
    unit: {
      type: Sequelize.STRING(50),
      allowNull: true
    },
    breadth: {
      type: Sequelize.STRING(50),
      allowNull: true
    }
  },
  merge(
    {
      sequelize,
      tableName: 'product',
      modelName: 'product'
    },
    InfoCrudMixin.options
  )
);

export { Product };
