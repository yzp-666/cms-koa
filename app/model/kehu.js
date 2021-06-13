import { InfoCrudMixin } from 'lin-mizar';
import { merge } from 'lodash';
import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';

class Kehu extends Model {
  toJSON () {
    const origin = {
      id: this.id, // id
      name: this.name, // 客户名
      phone: this.phone, // 客户联系方式
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

Kehu.init(
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
    fax: {
      type: Sequelize.STRING(20),
      allowNull: false
    },
    email: {
      type: Sequelize.STRING(20),
      allowNull: false
    },
    type: {
      type: Sequelize.INTEGER,
      allowNull: false
    },
    site: {
      type: Sequelize.STRING(200),
      allowNull: false
    },
    yqkje: {
      type: Sequelize.STRING(50),
      allowNull: false
    },
    jyje: {
      type: Sequelize.STRING(50),
      allowNull: false
    },
    ysje: {
      type: Sequelize.STRING(50),
      allowNull: false
    },
    yfhje: {
      type: Sequelize.STRING(50),
      allowNull: false
    },
    yfkje: {
      type: Sequelize.STRING(50),
      allowNull: false
    },
    bz: {
      type: Sequelize.STRING(100),
      allowNull: false
    }
  },
  merge(
    {
      sequelize,
      tableName: 'kehu',
      modelName: 'kehu'
    },
    InfoCrudMixin.options
  )
);

export { Kehu };
