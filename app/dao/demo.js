import { NotFound, Forbidden } from 'lin-mizar';
import Sequelize from 'sequelize';
import { Demo } from '../model/Demo';

class DemoDao {
  // 根据id获取单条数据
  async getId (id) {
    const demo = await Demo.findOne({
      where: {
        id
      }
    });
    return demo;
  }

  // 关键字搜索
  async getByKeyword (q) {
    const demo = await Demo.findOne({
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
    const demos = await Demo.findAndCountAll({
      limit: data.pageSize - 0,
      offset: (data.currentPage - 1) * (data.pageSize)
    });
    return demos;
  }

  // 创建数据
  async create (v) {
    const demo = await Demo.findOne({
      where: {
        name: v.get('body.name')
      }
    });
    if (demo) {
      throw new Forbidden({
        code: 10240
      });
    }
    const demoData = new Demo();
    demoData.name = v.get('body.name');
    demoData.phone = v.get('body.phone');
    demoData.sex = v.get('body.sex');
    await demoData.save();
  }

  // 更新数据
  async updata (v, id) {
    const demo = await Demo.findByPk(id);
    if (!demo) {
      throw new NotFound({
        code: 10022
      });
    }
    demo.name = v.get('body.name');
    demo.phone = v.get('body.phone');
    demo.sex = v.get('body.sex');
    await demo.save();
  }

  // 删除数据
  async delete (ids) {
    let demo;
    let demoArr = [];
    for (let i = 0; i < ids.length; i++) {
      demo = await Demo.findOne({
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

export { DemoDao };
