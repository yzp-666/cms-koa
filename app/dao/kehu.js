import { NotFound, Forbidden } from 'lin-mizar';
import Sequelize from 'sequelize';
import { Kehu } from '../model/kehu';

const DataKey = [ 'name', 'phone', 'fax', 'email', 'type', 'site', 'yqkje', 'bz' ];

class KehuDao {
  // 根据id获取单条数据
  async getId (id) {
    const demo = await Kehu.findOne({
      where: {
        id
      }
    });
    return demo;
  }

  // 关键字搜索
  async getByKeyword (q) {
    const demo = await Kehu.findOne({
      where: {
        name: {
          [Sequelize.Op.like]: `%${q}%`
        }
      }
    });
    return demo;
  }

  // 获取列表
  async getList (data) {
    const demos = await Kehu.findAndCountAll({
      limit: data.pageSize - 0,
      offset: (data.currentPage - 1) * (data.pageSize)
    });
    return demos;
  }

  // 创建数据
  async create (v) {
    const demo = await Kehu.findOne({
      where: {
        name: v.get('body.name')
      }
    });
    if (demo) {
      throw new Forbidden({
        code: 10240
      });
    }
    const demoData = new Kehu();
    for (let item of DataKey) {
      if (v.get(`body.${item}`)) {
        demoData[item] = v.get(`body.${item}`)
      } else {
        demoData[item] = ' '
      }
    }
    await demoData.save();
  }

  // 更新数据
  async updata (v, id) {
    const demo = await Kehu.findByPk(id);
    if (!demo) {
      throw new NotFound({
        code: 10022
      });
    }
    for (let item of DataKey) {
      if (v.get(`body.${item}`)) {
        demo[item] = v.get(`body.${item}`)
      } else {
        demo[item] = ' '
      }
    }
    await demo.save();
  }

  // 删除数据
  async delete (ids) {
    let demo;
    let demoArr = [];
    for (let i = 0; i < ids.length; i++) {
      demo = await Kehu.findOne({
        where: {
          id: ids[i]
        }
      });
      if (!demo) {
        throw new NotFound({
          code: 10022
        });
      }
      demoArr.push(demo);
    }

    demoArr.map(item => {
      item.destroy()
      return null
    })
  }
}

export { KehuDao };
