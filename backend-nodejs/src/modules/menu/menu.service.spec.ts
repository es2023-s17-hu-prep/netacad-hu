import { Test, TestingModule } from '@nestjs/testing';
import { MenuService } from './menu.service';
import { PrismaService } from '../../libs/prisma/prisma.service';
import { MenuItem } from '@prisma/client';

describe('MenuService', () => {
  let service: MenuService;

  beforeEach(async () => {
    const mockMenuItems: MenuItem[] = [
      {
        id: 1,
        title: 'test',
        link: 'link',
        createdAt: new Date(),
        updatedAt: new Date(),
      },
    ];
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        MenuService,
        {
          provide: PrismaService,
          useValue: {
            menuItem: {
              findMany: jest.fn().mockReturnValue(mockMenuItems),
            },
          },
        },
      ],
    }).compile();

    service = module.get<MenuService>(MenuService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  describe('findAll', () => {
    it('should return a list of menu items', async () => {
      const result = await service.findAll();
      expect(typeof result).toBe('object');
      expect(result[0].title).toBe('test');
      expect(result[0].link).toBe('link');
    });
  });
});
