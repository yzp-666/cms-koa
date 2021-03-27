import { InfoCrudMixin } from 'lin-mizar';
import { merge } from 'lodash';
import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';

class Color extends Model {
  toJSON () {
    const origin = {
      id: this.id,
      title: this.title,
      author: this.author,
      summary: this.summary,
      image: this.image
    };
    return origin;
  }
}

Color.init(
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    product_id: {
      type: Sequelize.STRING(50),
      allowNull: false
    },
    name: {
      type: Sequelize.STRING(30),
      allowNull: true,
    }
  },
  merge(
    {
      sequelize,
      tableName: 'color',
      modelName: 'color'
    },
    InfoCrudMixin.options
  )
);

export { Color };
