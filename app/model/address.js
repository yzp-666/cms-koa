import { InfoCrudMixin } from 'lin-mizar';
import { merge } from 'lodash';
import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';

class Address extends Model {
  toJSON () {
    const origin = {
      id: this.id,
      province: this.province, // 省
      city: this.city,  // 市
      district: this.district, // 区
      street: this.street, // 街道
      default: this.default
    };
    return origin;
  }
}

Address.init(
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    province: {
      type: Sequelize.STRING(10),
      allowNull: true
    },
    city: {
      type: Sequelize.STRING(10),
      allowNull: true,
    },
    district: {
      type: Sequelize.STRING(10),
      allowNull: true
    },
    street: {
      type: Sequelize.STRING(100),
      allowNull: true
    },
    default: {
      type: Sequelize.INTEGER,
      allowNull: true
    },
    user_id: {
      type: Sequelize.INTEGER,
      allowNull: true
    }
  },
  merge(
    {
      sequelize,
      tableName: 'address',
      modelName: 'address'
    },
    InfoCrudMixin.options
  )
);

export { Address };
