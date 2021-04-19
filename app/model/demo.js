import { InfoCrudMixin } from 'lin-mizar';
import { merge } from 'lodash';
import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';

class Demo extends Model {
  toJSON () {
    const origin = {
      id: this.id,
      name: this.name,
      phone: this.phone,
      sex: this.sex
    };
    return origin;
  }
}

Demo.init(
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: Sequelize.STRING(50),
      allowNull: false
    },
    phone: {
      type: Sequelize.STRING(20),
      allowNull: false
    },
    sex: {
      type: Sequelize.INTEGER,
      allowNull: false
    }
  },
  merge(
    {
      sequelize,
      tableName: 'demo',
      modelName: 'demo'
    },
    InfoCrudMixin.options
  )
);

export { Demo };
