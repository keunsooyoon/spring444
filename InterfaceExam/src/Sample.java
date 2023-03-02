
public class Sample {

	public static void main(String[] args) {
		
		ZooKeeper zooKeeper = new ZooKeeper();
		Tiger tiger = new Tiger();
		Lion lion = new Lion();
//		
//		zooKeeper.feed(tiger);
//		zooKeeper.feed(lion);
		
		Bouncer bouncer = new Bouncer();
		bouncer.barkAnimal(tiger);
		bouncer.barkAnimal(lion);
		
	}
}


