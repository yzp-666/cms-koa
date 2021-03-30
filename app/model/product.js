import { InfoCrudMixin } from 'lin-mizar';
import { merge } from 'lodash';
import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';

class Product extends Model {
  toJSON () {
    const origin = {
      id: this.id,
      // images: this.images,
      code: this.code,
      name: this.name,
      unit: this.unit, // 1: kg  , 2：m
      price: this.price,
      types: this.types,
      remark: this.remark
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
    // images: {
    //   type: Sequelize.STRING(1000),
    //   allowNull: true
    // },
    code: {
      type: Sequelize.STRING(10),
      allowNull: false
    },
    name: {
      type: Sequelize.STRING(50),
      allowNull: false
    },
    unit: {
      type: Sequelize.INTEGER,
      allowNull: true,
      defaultValue: 1
    },
    types: {
      type: Sequelize.STRING(200),
      allowNull: true
    },
    price: {
      type: Sequelize.STRING(50),
      allowNull: true
    },
    /* 成分 */
    // component: {
    //   type: Sequelize.STRING(50),
    //   allowNull: true
    // },
    /* 适用用场景 */
    // scene: {
    //   type: Sequelize.STRING(200),
    //   allowNull: true
    // },
    /* 产品特性 */
    // trait: {
    //   type: Sequelize.STRING(200),
    //   allowNull: true
    // },
    /* 制作工艺 */
    // craft: {
    //   type: Sequelize.STRING(500),
    //   allowNull: true
    // },
    remark: {
      type: Sequelize.STRING(1000),
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
