import router from '@ohos.router';

// 定义或导入 routerParam 的返回值类型
interface PageRouterParam {
  name: string
}

// 定义 mock 实现
const MockRouter: Record<string, Object> = {
  'getParams': () => {
    return { name: 'Mocked' } as PageRouterParam;
  },
  // 复用原始实现
  'pushUrl': router.pushUrl,
  'replaceUrl': router.replaceUrl,
};

export default MockRouter;