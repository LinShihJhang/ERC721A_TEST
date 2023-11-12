// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {MyERC721E,MyERC721A} from "../src/ERC721Compare.sol";


contract ERC721CompareTest is Test {
    MyERC721E public myERC721E;
    MyERC721A public myERC721A;
    address user1;
    address user2;

    function setUp() public {
        myERC721E = new MyERC721E();
        myERC721A = new MyERC721A();

        user1 = makeAddr('user1');
        user2 = makeAddr('user2');
        deal(user1, 10 ether);
        deal(user2, 10 ether);
    }

    function testERC721EMint1() public {
        uint256 amount = 1;
        vm.startPrank(user1);
        for(uint256 i = 0; i < amount; i++) {
            myERC721E.mint(user1, i);
        }
        assertEq(myERC721E.balanceOf(user1), amount);
        vm.stopPrank();
    }

    function testERC721EMint10() public {
        uint256 amount = 10;
        vm.startPrank(user1);
        for(uint256 i = 0; i < amount; i++) {
            myERC721E.mint(user1, i);
        }
        assertEq(myERC721E.balanceOf(user1), amount);
        vm.stopPrank();
    }

    function testERC721EMint100() public {
        uint256 amount = 100;
        vm.startPrank(user1);
        for(uint256 i = 0; i < amount; i++) {
            myERC721E.mint(user1, i);
        }
        assertEq(myERC721E.balanceOf(user1), amount);
        vm.stopPrank();
    }

    function testERC721EMint1000() public {
        uint256 amount = 1000;
        vm.startPrank(user1);
        for(uint256 i = 0; i < amount; i++) {
            myERC721E.mint(user1, i);
        }
        assertEq(myERC721E.balanceOf(user1), amount);
        vm.stopPrank();
    }

    
    function testERC721AMint1() public {
        uint256 amount = 1;
        vm.startPrank(user1);
        myERC721A.mint(user1, amount);
        assertEq(myERC721A.balanceOf(user1),amount);
        vm.stopPrank();
    }

    function testERC721AMint10() public {
        uint256 amount = 10;
        vm.startPrank(user1);
        myERC721A.mint(user1, amount);
        assertEq(myERC721A.balanceOf(user1),amount);
        vm.stopPrank();
    }

    function testERC721AMint100() public {
        uint256 amount = 100;
        vm.startPrank(user1);
        myERC721A.mint(user1, amount);
        assertEq(myERC721A.balanceOf(user1),amount);
        vm.stopPrank();
    }

    function testERC721AMint1000() public {
        uint256 amount = 1000;
        vm.startPrank(user1);
        myERC721A.mint(user1, amount);
        assertEq(myERC721A.balanceOf(user1),amount);
        vm.stopPrank();
    }

    function testERC721ETransfer1() public {
        uint256 amount = 1;
        vm.startPrank(user1);
        for(uint256 i = 0; i < amount; i++) {
            myERC721E.mint(user1, i);
            myERC721E.safeTransferFrom(user1, user2, i);
        }
        assertEq(myERC721E.balanceOf(user2), amount);
        vm.stopPrank();
    }

    function testERC721ETransfer10() public {
        uint256 amount = 10;
        vm.startPrank(user1);
        for(uint256 i = 0; i < amount; i++) {
            myERC721E.mint(user1, i);
            myERC721E.safeTransferFrom(user1, user2, i);
        }
        assertEq(myERC721E.balanceOf(user2), amount);
        vm.stopPrank();
    }

    function testERC721ETransfer100() public {
        uint256 amount = 100;
        vm.startPrank(user1);
        for(uint256 i = 0; i < amount; i++) {
            myERC721E.mint(user1, i);
            myERC721E.safeTransferFrom(user1, user2, i);
        }
        assertEq(myERC721E.balanceOf(user2), amount);
        vm.stopPrank();
    }

    function testERC721ETransfer1000() public {
        uint256 amount = 1000;
        vm.startPrank(user1);
        for(uint256 i = 0; i < amount; i++) {
            myERC721E.mint(user1, i);
            myERC721E.safeTransferFrom(user1, user2, i);
        }
        assertEq(myERC721E.balanceOf(user2), amount);
        vm.stopPrank();
    }

    function testERC721ATransfer1() public {
        uint256 amount = 1;
        vm.startPrank(user1);
        myERC721A.mint(user1, amount);
        for(uint256 i = 0; i < amount; i++) {
            myERC721A.safeTransferFrom(user1, user2, i);
        }
        assertEq(myERC721A.balanceOf(user2),amount);
        vm.stopPrank();
    }

    function testERC721ATransfer10() public {
        uint256 amount = 10;
        vm.startPrank(user1);
        myERC721A.mint(user1, amount);
        for(uint256 i = 0; i < amount; i++) {
            myERC721A.safeTransferFrom(user1, user2, i);
        }
        assertEq(myERC721A.balanceOf(user2),amount);
        vm.stopPrank();
    }

    function testERC721ATransfer100() public {
        uint256 amount = 100;
        vm.startPrank(user1);
        myERC721A.mint(user1, amount);
        for(uint256 i = 0; i < amount; i++) {
            myERC721A.safeTransferFrom(user1, user2, i);
        }
        assertEq(myERC721A.balanceOf(user2),amount);
        vm.stopPrank();
    }

    function testERC721ATransfer1000() public {
        uint256 amount = 1000;
        vm.startPrank(user1);
        myERC721A.mint(user1, amount);
        for(uint256 i = 0; i < amount; i++) {
            myERC721A.safeTransferFrom(user1, user2, i);
        }
        assertEq(myERC721A.balanceOf(user2),amount);
        vm.stopPrank();
    }

    function testERC721EApproveAll() public {
        vm.startPrank(user1);
        myERC721E.setApprovalForAll(user2, true);
        assertTrue(myERC721E.isApprovedForAll(user1, user2));
        vm.stopPrank();
    }

    function testERC721EApprove1() public {
        uint256 amount = 1;
        vm.startPrank(user1);
        for(uint256 i = 0; i < amount; i++) {
            myERC721E.mint(user1, i);
            myERC721E.approve(user2, i);
            assertEq(myERC721E.getApproved(i),user2);
        }
        vm.stopPrank();
    }

    function testERC721EApprove10() public {
        uint256 amount = 10;
        vm.startPrank(user1);
        for(uint256 i = 0; i < amount; i++) {
            myERC721E.mint(user1, i);
            myERC721E.approve(user2, i);
            assertEq(myERC721E.getApproved(i),user2);
        }
        vm.stopPrank();
    }

    function testERC721EApprove100() public {
        uint256 amount = 100;
        vm.startPrank(user1);
        for(uint256 i = 0; i < amount; i++) {
            myERC721E.mint(user1, i);
            myERC721E.approve(user2, i);
            assertEq(myERC721E.getApproved(i),user2);
        }
        vm.stopPrank();
    }

    function testERC721EApprove1000() public {
        uint256 amount = 1000;
        vm.startPrank(user1);
        for(uint256 i = 0; i < amount; i++) {
            myERC721E.mint(user1, i);
            myERC721E.approve(user2, i);
            assertEq(myERC721E.getApproved(i),user2);
        }
        vm.stopPrank();
    }

    function testERC721AApproveAll() public {
        vm.startPrank(user1);
        myERC721A.setApprovalForAll(user2, true);
        assertTrue(myERC721A.isApprovedForAll(user1, user2));
        vm.stopPrank();        
    }


    function testERC721AApprove1() public {
        uint256 amount = 1;
        vm.startPrank(user1);
        myERC721A.mint(user1, amount);
        for(uint256 i = 0; i < amount; i++) {
            myERC721A.approve(user2, i);
            assertEq(myERC721A.getApproved(i),user2);
        }
        vm.stopPrank();     
    }

    function testERC721AApprove10() public {
        uint256 amount = 10;
        vm.startPrank(user1);
        myERC721A.mint(user1, amount);
        for(uint256 i = 0; i < amount; i++) {
            myERC721A.approve(user2, i);
            assertEq(myERC721A.getApproved(i),user2);
        }
        vm.stopPrank();     
    }

    function testERC721AApprove100() public {
        uint256 amount = 100;
        vm.startPrank(user1);
        myERC721A.mint(user1, amount);
        for(uint256 i = 0; i < amount; i++) {
            myERC721A.approve(user2, i);
            assertEq(myERC721A.getApproved(i),user2);
        }
        vm.stopPrank();     
    }

    function testERC721AApprove1000() public {
        uint256 amount = 1000;
        vm.startPrank(user1);
        myERC721A.mint(user1, amount);
        for(uint256 i = 0; i < amount; i++) {
            myERC721A.approve(user2, i);
            assertEq(myERC721A.getApproved(i),user2);
        }
        vm.stopPrank();     
    }


    // function testCompare() public {
    //     vm.startPrank(user1);

    //     for(uint256 i = 0; i < 10; i++) {
    //         myERC721E.mint(user1, i);
    //         myERC721E.approve(user2, i);
    //         assertEq(myERC721E.getApproved(i),user2);
    //         myERC721E.safeTransferFrom(user1, user2, i);
    //     }
    //     myERC721E.setApprovalForAll(user2, true);
    //     assertTrue(myERC721E.isApprovedForAll(user1, user2));

    //     vm.stopPrank();

    //     //-----------------------------------------------------

    //     vm.startPrank(user1);

    //     myERC721A.mint(user1, 10);
    //     for(uint256 i = 0; i < 10; i++) {
    //         myERC721A.approve(user2, i);
    //         assertEq(myERC721A.getApproved(i),user2);
    //         myERC721A.safeTransferFrom(user1, user2, i);
    //     }
        
    //     myERC721A.setApprovalForAll(user2, true);
    //     assertTrue(myERC721A.isApprovedForAll(user1, user2));

    //     vm.stopPrank();
        
    // }
}
