import java.util.ArrayList;
import java.util.HashSet;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.Map;

public class CollectionsDemo {
    public static void main(String[] args) {
        // Demonstrating ArrayList
        List<String> arrayList = new ArrayList<>();
        arrayList.add("Apple");
        arrayList.add("Banana");
        arrayList.add("Cherry");
        System.out.println("ArrayList: " + arrayList);

        // Demonstrating HashSet
        Set<String> hashSet = new HashSet<>();
        hashSet.add("Apple");
        hashSet.add("Banana");
        hashSet.add("Cherry");
        hashSet.add("Apple");  // This will not add another "Apple" because sets do not allow duplicates
        System.out.println("HashSet: " + hashSet);

        // Demonstrating HashMap
        Map<Integer, String> hashMap = new HashMap<>();
        hashMap.put(1, "Apple");
        hashMap.put(2, "Banana");
        hashMap.put(3, "Cherry");
        // Accessing an element by key
        String itemAtKey2 = hashMap.get(2);
        System.out.println("HashMap: " + hashMap);
        System.out.println("Element at key 2 in HashMap: " + itemAtKey2);
    }
}
