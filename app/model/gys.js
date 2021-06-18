import { InfoCrudMixin } from 'lin-mizar';
import { merge } from 'lodash';
import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';

class Gys extends Model {
  toJSON () {
    const origin = {
      id: this.id, // id
      name: this.name, // 供应商名
      phone: this.phone, // 供应商联系方式
      fax: this.fax, // 传真
      email: this.email, // 邮箱
      type: this.type, // 客户类型
      site: this.site, // 客户地址
      yqkje: this.yqkje, // 预欠款金额
      jyje: this.jyje, // 交易金额
      ysje: this.ysje, // 预收款金额
      yfhje: this.yfhje, // 已发货金额
      yfkje: this.yfkje, // 已付款金额
      bz: this.bz // 备注
    };
    return origin;
  }
}

Gys.init(
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
      allowNull: true
    },
    fax: {
      type: Sequelize.STRING(20),
      allowNull: true
    },
    email: {
      type: Sequelize.STRING(20),
      allowNull: true
    },
    type: {
      type: Sequelize.STRING(20),
      allowNull: true
    },
    site: {
      type: Sequelize.STRING(200),
      allowNull: true
    },
    yqkje: {
      type: Sequelize.STRING(50),
      allowNull: true,
      defaultValue: '0'
    },
    jyje: {
      type: Sequelize.STRING(50),
      allowNull: true,
      defaultValue: '0'
    },
    ysje: {
      type: Sequelize.STRING(50),
      allowNull: true,
      defaultValue: '0'
    },
    yfhje: {
      type: Sequelize.STRING(50),
      allowNull: true,
      defaultValue: '0'
    },
    yfkje: {
      type: Sequelize.STRING(50),
      allowNull: true,
      defaultValue: '0'
    },
    bz: {
      type: Sequelize.STRING(100),
      allowNull: true
    }
  },
  merge(
    {
      sequelize,
      tableName: 'gys',
      modelName: 'gys'
    },
    InfoCrudMixin.options
  )
);

export { Gys };
