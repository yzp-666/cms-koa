import { InfoCrudMixin } from 'lin-mizar';
import { merge } from 'lodash';
import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';

class SupplierType extends Model {
  toJSON () {
    const origin = {
      value: this.id,
      label: this.name // 客户名称
    };
    return origin;
  }
}

SupplierType.init(
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: Sequelize.STRING(50),
      allowNull: false
    }
  },
  merge(
    {
      sequelize,
      tableName: 'supplier_type',
      modelName: 'supplier_type'
    },
    InfoCrudMixin.options
  )
);

export { SupplierType };
