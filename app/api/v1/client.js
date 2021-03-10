import { LinRouter, NotFound, disableLoading } from 'lin-mizar';
// import { groupRequired } from '../../middleware/jwt'; // 权限判断
// import {
//     BookSearchValidator,
//     CreateOrUpdateBookValidator
// } from '../../validator/book'; // 自定义验证
// import { PositiveIdValidator } from '../../validator/common'; // 参数验证
//
// import { getSafeParamId } from '../../lib/util'; // 验证id
// import { BookNotFound } from '../../lib/exception'; // 异常
import { ClientDao } from '../../dao/client';

// client 的红图实例
const clientApi = new LinRouter({
    prefix: '/v1/client',
    module: '图书'
});

// book 的dao 数据库访问层实例
const clientDao = new ClientDao();

// bookApi.get('/:id', async ctx => {
//     const v = await new PositiveIdValidator().validate(ctx);
//     const id = v.get('path.id');
//     const book = await bookDto.getBook(id);
//     if (!book) {
//         throw new NotFound({
//             code: 10022
//         });
//     }
//     ctx.json(book);
// });

clientApi.get('/', async ctx => {
    const clients = await clientDao.getClients();
    // if (!books || books.length < 1) {
    //   throw new NotFound({
    //     message: '没有找到相关书籍'
    //   });
    // }
    ctx.json(clients);
});
//
// bookApi.get('/search/one', async ctx => {
//     const v = await new BookSearchValidator().validate(ctx);
//     const book = await bookDto.getBookByKeyword(v.get('query.q'));
//     if (!book) {
//         throw new BookNotFound();
//     }
//     ctx.json(book);
// });
//
// bookApi.post('/', async ctx => {
//     const v = await new CreateOrUpdateBookValidator().validate(ctx);
//     await bookDto.createBook(v);
//     ctx.success({
//         code: 12
//     });
// });
//
// bookApi.put('/:id', async ctx => {
//     const v = await new CreateOrUpdateBookValidator().validate(ctx);
//     const id = getSafeParamId(ctx);
//     await bookDto.updateBook(v, id);
//     ctx.success({
//         code: 13
//     });
// });
//
// bookApi.linDelete(
//     'deleteBook',
//     '/:id',
//     bookApi.permission('删除图书'),
//     groupRequired,
//     async ctx => {
//         const v = await new PositiveIdValidator().validate(ctx);
//         const id = v.get('path.id');
//         await bookDto.deleteBook(id);
//         ctx.success({
//             code: 14
//         });
//     }
// );

module.exports = { clientApi, [disableLoading]: false };
