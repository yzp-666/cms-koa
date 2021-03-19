import { InfoCrudMixin } from 'lin-mizar';
import { merge } from 'lodash';
import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';

class Address extends Model {
  toJSON () {
    const origin = {
      id: this.id,
      firm_name: this.firm_name, // 公司名称
      address: this.address, // 地址
      linkman: this.linkman, // 联系人
      link_phone: this.link_phone, // 联系人电话
      remark: this.remark // 备注
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
    firm_name: {
      type: Sequelize.STRING(200),
      allowNull: true
    },
    address: {
      type: Sequelize.STRING(200),
      allowNull: true
    },
    linkman: {
      type: Sequelize.STRING(100),
      allowNull: true
    },
    link_phone: {
      type: Sequelize.STRING(20),
      allowNull: true
    },
    remark: {
      type: Sequelize.STRING(1000),
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
