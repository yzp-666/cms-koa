import { InfoCrudMixin } from 'lin-mizar';
import { merge } from 'lodash';
import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';

class Client extends Model {
    toJSON () {
        const origin = {
            id: this.id,
            name: this.name, // 客户名称
            typeId: this.typeId, // 客户属性
            phone: this.phone, // 电话
            byPhone: this.byPhone,
            email: this.email,
            addressIDs: this.addressIDs,
            remark: this.remark,
            fax: this.fax,
            htje: this.htje, // 合同金额
            ysh: this.ysh, // 已送货
            yshk: this.yshk, // 预收货款
            wshk: this.wshk, // 未收货款
            okhk: this.okhk // 已收货款
        };
        return origin;
    }
}

Client.init(
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
        typeId: {
            type: Sequelize.INTEGER,
            allowNull: false
        },
        phone: {
            type: Sequelize.STRING(20),
            allowNull: true,
        },
        byPhone: {
            type: Sequelize.STRING(20),
            allowNull: true,
        },
        email: {
            type: Sequelize.STRING(35),
            allowNull: true,
        },
        addressIDs: {
            type: Sequelize.STRING(1000),
            allowNull: true,
        },
        remark: {
            type: Sequelize.STRING(1000),
            allowNull: true,
        },
        fax: {
            type: Sequelize.STRING(20),
            allowNull: true,
        },
        htje: {
            type: Sequelize.STRING(1000),
            allowNull: true,
            // defaultValue: '未设置'
        },
        ysh: {
            type: Sequelize.STRING(1000),
            allowNull: true
        },
        yshk: {
            type: Sequelize.STRING(1000),
            allowNull: true
        },
        wshk: {
            type: Sequelize.STRING(1000),
            allowNull: true
        },
        okhk: {
            type: Sequelize.STRING(1000),
            allowNull: true
        }
    },
    merge(
        {
            sequelize,
            tableName: 'client',
            modelName: 'client'
        },
        InfoCrudMixin.options
    )
);

export { Client };
