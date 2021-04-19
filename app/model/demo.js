import { InfoCrudMixin } from 'lin-mizar';
import { merge } from 'lodash';
import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';

class Demo extends Model {
  toJSON () {
    const origin = {
      id: this.id,
      name: this.name
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
